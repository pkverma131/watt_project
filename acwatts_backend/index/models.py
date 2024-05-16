from django.db import models
from catalogue.models import AuditModelMixin
from django.db.models import F


class TileFilter(AuditModelMixin):
    filter_key = models.CharField(max_length=20)
    filter_value = models.CharField(max_length=20)

    def __str__(self):
        return f'key {self.filter_key} value {self.filter_value}'


class TileCategory(AuditModelMixin):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=200)

    def __str__(self):
        return self.name

    def tile(self):
        return Tile.objects.filter(tile_category=self.id).values('id', 'thumbnail')


class Tile(AuditModelMixin):
    tile_category = models.ForeignKey(TileCategory, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    description = models.CharField(max_length=200)
    thumbnail = models.ImageField(upload_to='tiles/thumbnail/', default=None)

    def __str__(self):
        return self.name

    def filter(self):
        return TileToTileFilter.objects.filter(tile=self.id).values('tile_filter')


class TileToTileFilter(models.Model):
    tile = models.ForeignKey(Tile, on_delete=models.CASCADE)
    tile_filter = models.ForeignKey(TileFilter, on_delete=models.CASCADE)

