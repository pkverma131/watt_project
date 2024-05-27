from django.utils.deprecation import MiddlewareMixin
from django.conf import settings
from .models import SiteVisitor

class StatCounterMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # Check if the current path should be excluded from tracking
        if request.path_info in getattr(settings, 'STAT_COUNTER_EXCLUDE_URLS', []):
            return None

        # Get the visitor's IP address
        ip_address = request.META.get('REMOTE_ADDR')

        # Update or create a SiteVisitor entry for the current path and IP address
        site_visitor, created = SiteVisitor.objects.get_or_create(path=request.path_info, ip_address=ip_address)
        site_visitor.hits += 1

        # Increment unique_visits if it's a new visitor
        if created:
            site_visitor.unique_visits += 1

        site_visitor.save()

        # Continue processing the request
        return None
