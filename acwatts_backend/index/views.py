from django.http import HttpResponse
from django.template import loader
from .models import TileCategory
from .serializers import TileSerializer


def index(request):
    """View function for home page of site."""

    # TODO: Add tiles category
    # TODO: Add tiles to each category
    # TODO: Each tiles will have title, image and filter data

    template = loader.get_template('acmandi/index.html')

    queryset = TileCategory.objects.all()
    serializer_class = TileSerializer(queryset, many=True)

    context = {
        'products': ['Daikin 1.5 Ton 5 Star Inverter Split AC - FTKG50TV',
                     'LG 1.5 Ton 5 Star Inverter Split AC - KS-Q18YNZA',
                     'Hitachi 1.5 Ton 5 Star Inverter Split AC - RSOG518HDEA',
                     'Blue Star 1.5 Ton 5 Star Inverter Split AC - IC518DATUAP',
                     'Samsung 1.5 Ton 5 Star Inverter Split AC - AR18AY5YATZ',
                     'Voltas 1.5 Ton 5 Star Inverter Split AC - 185VH Crown AW',
                     'Carrier 1.5 Ton 5 Star Inverter Split AC - CAI18EK5R39F0',
                     'Godrej 1.5 Ton 5 Star Inverter Split AC - GIC 18HTC5-WTA',
                     'Whirlpool 1.5 Ton 5 Star Inverter Split AC - 3D Cool Elite Pro',
                     'Mitsubishi Heavy Duty 1.5 Ton 5 Star Inverter Split AC - SRK20CSS-S6'],
        'tiles': serializer_class.data
    }
    return HttpResponse(template.render(context, request))
