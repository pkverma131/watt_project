# blog_app/models.py
from django.db import models

class BlogPost(models.Model):
    title = models.CharField(max_length=200)
    key_points = models.TextField()
    main_content = models.TextField()
    pub_date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title
