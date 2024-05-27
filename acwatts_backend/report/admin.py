from django.contrib import admin
from .models import SiteVisitor, SessionData

class SiteVisitorAdmin(admin.ModelAdmin):
    list_display = ('path', 'ip_address', 'hits', 'unique_visits','last_visit')
    search_fields = ('path', 'ip_address')
    list_filter = ('path',)
    ordering = ('-hits',)

class SessionDataAdmin(admin.ModelAdmin):
    list_display = ('session_key', 'ip_address', 'created_at')
    search_fields = ('session_key', 'ip_address')
    readonly_fields = ('session_key', 'ip_address', 'created_at')


admin.site.register(SiteVisitor, SiteVisitorAdmin)
admin.site.register(SessionData, SessionDataAdmin)