from django.shortcuts import render
from django.db.models import Sum
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from .models import SiteVisitor

@login_required
def site_statistics_view(request):
    if not request.user.is_superuser:
        return HttpResponseForbidden()

    # Total visits to the website
    total_visits_to_website = SiteVisitor.objects.aggregate(total_hits=Sum('hits'))['total_hits'] or 0

    # Total unique visits to the website
    total_unique_visits_to_website = SiteVisitor.objects.aggregate(total_unique_visits=Sum('unique_visits'))['total_unique_visits'] or 0

    # Path-wise total visits and unique visits
    path_statistics = SiteVisitor.objects.values('path').annotate(
        total_hits=Sum('hits'),
        total_unique_visits=Sum('unique_visits')
    )

    context = {
        'total_visits_to_website': total_visits_to_website,
        'total_unique_visits_to_website': total_unique_visits_to_website,
        'path_statistics': path_statistics,
    }
    return render(request, 'site_statistics.html', context)

def custom_403_view(request, exception=None):
    return render(request, '403.html', status=403)
