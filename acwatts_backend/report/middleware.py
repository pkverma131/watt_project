from django.utils.deprecation import MiddlewareMixin
from django.conf import settings
from .models import SiteVisitor
import logging

logger = logging.getLogger(__name__)

class SiteVisitorMiddleware(MiddlewareMixin):
    def process_request(self, request):
        try:
            # Check if the current path should be excluded from tracking
            if request.path_info.startswith('/admin/') or request.path_info in getattr(settings, 'STAT_COUNTER_EXCLUDE_URLS', []):
                return None

            # Get client IP address
            ip_address = self.get_client_ip(request)

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
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip
