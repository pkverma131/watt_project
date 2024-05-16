from django.contrib import admin
from .models import Tile, TileCategory, TileFilter, TileToTileFilter


class TileAdmin(admin.ModelAdmin):
    list_display = ('tile_category', 'name', 'description', 'thumbnail')
    fields = ('tile_category', 'name', 'description', 'thumbnail')


class TileCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description')
    fields = ('name', 'description')


class TileFilterAdmin(admin.ModelAdmin):
    list_display = ('filter_key', 'filter_value')
    fields = ('filter_key', 'filter_value')


class TileToTileFilterAdmin(admin.ModelAdmin):
    list_display = ('tile', 'tile_filter')
    fields = ('tile', 'tile_filter')


admin.site.register(Tile, TileAdmin)
admin.site.register(TileCategory, TileCategoryAdmin)
admin.site.register(TileFilter, TileFilterAdmin)
admin.site.register(TileToTileFilter, TileToTileFilterAdmin)

