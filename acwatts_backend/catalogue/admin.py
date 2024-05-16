from django.contrib import admin

from .models import Product, ProductHighlight, ProductMedia, ProductLink, \
    Specification, SpecificationType, Brand, MarketPlace, ImportantSpecification,\
    ProductCategory, ProductToProductCategory, ProductToProductHighlight,ProductToSpecification


class BrandAdmin(admin.ModelAdmin):
    list_display = ('name', 'code', 'company', 'origin_country',
                    'manufacture_country', 'support_contact', 'support_email', 'address')
    fields = ('name', 'code', 'company', 'origin_country',
              'manufacture_country', 'support_contact', 'support_email', 'address')


class ProductAdmin(admin.ModelAdmin):
    list_display = ('brand', 'title', 'description', 'model_number', 'thumbnail')
    fields = ('brand', 'title', 'description', 'model_number', 'thumbnail')


class ProductHighlightAdmin(admin.ModelAdmin):
    list_display = ('highlight', 'type')
    fields = ('highlight', 'type')

class ProductToProductHighlightAdmin(admin.ModelAdmin):
    list_display = ('product','highlight')
    fields = ('product','highlight')

class ProductMediaAdmin(admin.ModelAdmin):
    list_display = ('product', 'is_thumbnail', 'media_file')
    fields = ('product', 'is_thumbnail', 'media_file')


class ProductLinkAdmin(admin.ModelAdmin):
    list_display = ('product', 'marketplace', 'link', 'mrp', 'discount', 'sales_price')
    fields = ('product', 'marketplace', 'link', 'mrp', 'discount', 'sales_price')


class SpecificationTypeAdmin(admin.ModelAdmin):
    list_display = ('type', 'description')
    fields = ('type', 'description')


class SpecificationAdmin(admin.ModelAdmin):
    list_display = ('specification_type', 'label', 'value')
    fields = ('specification_type', 'label', 'value')

class ProductToSpecificationAdmin(admin.ModelAdmin):
    list_display = ('product','specification')
    fields = ('product','specification')

class MarketPlaceAdmin(admin.ModelAdmin):
    list_display = ('name', 'logo', 'website')
    fields = ('name', 'logo', 'website')


class ImportantSpecificationAdmin(admin.ModelAdmin):
    list_display = ('product', 'wattage', 'coverage_area', 'energy_rating','default_bill_amount')
    fields = ('product', 'wattage', 'coverage_area', 'energy_rating','default_bill_amount')


class ProductCategoryAdmin(admin.ModelAdmin):
    list_display = ('name', 'description', 'thumbnail')
    fields = ('name', 'description', 'thumbnail')


class ProductToProductCategoryAdmin(admin.ModelAdmin):
    list_display = ('product', 'product_category')
    fields = ('product','product_category')


admin.site.register(Brand, BrandAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(ProductHighlight, ProductHighlightAdmin)
admin.site.register(ProductMedia, ProductMediaAdmin)
admin.site.register(ProductLink, ProductLinkAdmin)
admin.site.register(SpecificationType, SpecificationTypeAdmin)
admin.site.register(Specification, SpecificationAdmin)
admin.site.register(MarketPlace, MarketPlaceAdmin)
admin.site.register(ImportantSpecification, ImportantSpecificationAdmin)
admin.site.register(ProductCategory, ProductCategoryAdmin)
admin.site.register(ProductToProductCategory, ProductToProductCategoryAdmin)
admin.site.register(ProductToProductHighlight, ProductToProductHighlightAdmin)
admin.site.register(ProductToSpecification, ProductToSpecificationAdmin)
