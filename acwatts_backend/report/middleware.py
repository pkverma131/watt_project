from django.utils.deprecation import MiddlewareMixin
from django.conf import settings
from django.utils import timezone
from .models import SiteVisitor, SessionData
import logging

logger = logging.getLogger(__name__)

class SiteVisitorMiddleware(MiddlewareMixin):
    def process_request(self, request):
        try:
            # Check if the current path should be excluded from tracking
            exclude_paths = ['/admin/', '/wagtail-admin/', '/media/', '/report/'] + getattr(settings, 'STAT_COUNTER_EXCLUDE_URLS', [])
            if any(request.path_info.startswith(path) for path in exclude_paths):
                return None

            # Get client IP address
            ip_address = self.get_client_ip(request)

            # Track session based on IP address
            session_key = request.session.session_key
            if session_key:
                if not SessionData.objects.filter(session_key=session_key).exists():
                    # New session, create a new SessionData entry
                    SessionData.objects.create(
                        session_key=session_key,
                        ip_address=ip_address,
                        created_at=timezone.now()
                    )

            # Update or create a SiteVisitor entry for the current path and IP address
            site_visitor, created = SiteVisitor.objects.get_or_create(path=request.path_info, ip_address=ip_address)
            site_visitor.hits += 1
            if created:
                site_visitor.unique_visits += 1
            site_visitor.save()

        except Exception as e:
            logger.error(f"Error processing request: {e}")

        # Continue processing the request
        return None

    def get_client_ip(self, request):
        # Method to retrieve the client's IP address from the request
        try:
            x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
            if x_forwarded_for:
                ip = x_forwarded_for.split(',')[0]
            else:
                ip = request.META.get('REMOTE_ADDR')
            return ip
        except Exception as e:
            logger.error(f"Error getting client IP: {e}")
            return None
