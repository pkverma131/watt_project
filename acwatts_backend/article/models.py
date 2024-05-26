from django.db import models
from wagtail.models import Page
from wagtail.fields import StreamField
from wagtail import blocks
from wagtail.admin.panels import FieldPanel
from wagtail.images.blocks import ImageChooserBlock
from wagtail.api import APIField

class BlogPage(Page):
    author = models.CharField(max_length=255)
    date = models.DateField("Post date")
    post_image = models.ForeignKey(
        'wagtailimages.Image',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+'
    )
    body = StreamField([
        ('heading', blocks.CharBlock(form_classname="title")),
        ('paragraph', blocks.RichTextBlock()),
        ('image', ImageChooserBlock()),
    ])

    content_panels = Page.content_panels + [
        FieldPanel('author'),
        FieldPanel('date'),
        FieldPanel('post_image'),
        FieldPanel('body'),
    ]

    # Export fields over the API
    api_fields = [
        APIField('date'),
        APIField('body'),
        APIField('post_image'),
        APIField('author'),
    ]
