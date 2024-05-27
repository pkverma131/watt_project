from django.db import models

class SiteVisitor(models.Model):
    path = models.CharField(max_length=255, unique=True)
    ip_address = models.CharField(max_length=39)  # Assuming IPv6 support
    hits = models.PositiveIntegerField(default=0)
    unique_visits = models.PositiveIntegerField(default=0)
    last_visit = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.path
