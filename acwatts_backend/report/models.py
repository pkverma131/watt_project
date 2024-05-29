from django.db import models

class SiteVisitor(models.Model):
    path = models.CharField(max_length=255)
    ip_address = models.CharField(max_length=39, null=True)
    hits = models.PositiveIntegerField(default=0)
    unique_visits = models.PositiveIntegerField(default=0)
    last_visit = models.DateTimeField(auto_now=True)

    class Meta:
        unique_together = ('path', 'ip_address')

    def __str__(self):
        return self.path

class SessionData(models.Model):
    session_key = models.CharField(max_length=40, primary_key=True)
    ip_address = models.CharField(max_length=39, null=True)  # Assuming IPv6 support
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.session_key
