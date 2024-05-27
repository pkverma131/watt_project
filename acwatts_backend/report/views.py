from django.shortcuts import render
from django.db.models import Count, Sum
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from django.contrib.sessions.models import Session
from .models import SiteVisitor, SessionData

@login_required
def site_statistics_view(request):
    if not request.user.is_superuser:
        return HttpResponseForbidden()

    # Total visits to the website (sum of hits across all paths)
    total_visits_to_website = SiteVisitor.objects.aggregate(total_hits=Sum('hits')).get('total_hits') or 0

    # Total unique visits to the website (count distinct IP addresses)
    total_unique_visits_to_website = SiteVisitor.objects.aggregate(total_unique_visits=Count('ip_address', distinct=True)).get('total_unique_visits') or 0

    # Total website sessions
    total_user_sessions = SessionData.objects.count()
    
    # Path-wise total visits and unique visits
    path_statistics = SiteVisitor.objects.values('path').annotate(
        total_hits=Sum('hits'),
        total_unique_visits=Count('ip_address', distinct=True)
    )

    context = {
        'total_visits_to_website': total_visits_to_website,
        'total_unique_visits_to_website': total_unique_visits_to_website,
        'total_user_sessions': total_user_sessions,
        'path_statistics': path_statistics,
    }
    return render(request, 'site_statistics.html', context)

def custom_403_view(request, exception=None):
    return render(request, '403.html', status=403)
