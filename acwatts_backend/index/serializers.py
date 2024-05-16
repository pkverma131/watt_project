from .models import TileCategory
from rest_framework import routers, serializers


class TileSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = TileCategory
        fields = ['name', 'description', 'tile']
