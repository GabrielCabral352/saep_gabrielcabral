
from rest_framework import serializers
from .models import *

class UserTechSerializer(serializers.ModelSerializer):

    class Meta:
        model = UserTech
        fields = ['id', 'name']


class ToolSerializer(serializers.ModelSerializer):

    class Meta:
        model = Tool
        fields = '__all__'

class CommentsSerializer(serializers.ModelSerializer):

    class Meta:
        model = Comment
        fields = '__all__'

class GetCommentsSerializer(serializers.ModelSerializer):
    fk_user = UserTechSerializer(read_only=True)
    fk_tool = ToolSerializer(read_only=True)
    
    class Meta:
        model = Comment
        fields = '__all__'