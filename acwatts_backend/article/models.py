from django.db import models
from wagtail.models import Page
from wagtail.fields import StreamField
from wagtail import blocks
from wagtail.admin.panels import FieldPanel
from wagtail.images.blocks import ImageChooserBlock
from wagtail.api import APIField
from modelcluster.contrib.taggit import ClusterTaggableManager
from taggit.models import TaggedItemBase
from modelcluster.fields import ParentalKey
from django.utils.html import strip_tags


class BlogPageTag(TaggedItemBase):
    content_object = ParentalKey(
        'BlogPage',
        related_name='tagged_items',
        on_delete=models.CASCADE
    )

class BlogPage(Page):
    author = models.CharField(max_length=255)
    date = models.DateField("Post date")
    tags = ClusterTaggableManager(through=BlogPageTag, blank=True)
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

    def blog_snippet(self):
        # Extract the first line from the body StreamField
        first_paragraph = self.body[0].value.source  # Assuming the first block is a paragraph
        first_line = first_paragraph.split('\n')[0].strip()
        return strip_tags(first_line)

    content_panels = Page.content_panels + [
        FieldPanel('author'),
        FieldPanel('date'),
        FieldPanel('tags'),
        FieldPanel('post_image'),
        FieldPanel('body'),
    ]

    # Export fields over the API
    api_fields = [
        APIField('date'),
        APIField('body'),
        APIField('post_image'),
        APIField('author'),
        APIField('tags'),
        APIField('blog_snippet'),
    ]
