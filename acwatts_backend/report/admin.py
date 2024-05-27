from django.contrib import admin
from .models import SiteVisitor

class SiteVisitorAdmin(admin.ModelAdmin):
    list_display = ('path', 'ip_address', 'hits', 'unique_visits','last_visit')
    search_fields = ('path', 'ip_address')
    list_filter = ('path',)
    ordering = ('-hits',)

admin.site.register(SiteVisitor, SiteVisitorAdmin)