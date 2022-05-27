from django.contrib import admin
from .models import *

class detUserTech(admin.ModelAdmin):
    list_display = ('id', 'name')
    list_display_links = ('id',)
    search_fields = ('name',)
    list_per_page = 10

class detTool(admin.ModelAdmin):
    list_display = ('id', 'name', 'description','insertDate','status', 'image')
    list_display_links = ('id',)
    search_fields = ('name',)
    list_per_page = 10

class detComment(admin.ModelAdmin):
    list_display = ('id', 'commentDate', 'description', 'fk_tool', 'fk_user')
    list_display_links = ('id','fk_tool', 'fk_user')
    search_fields = ('description',)
    list_per_page = 10


admin.site.register(UserTech, detUserTech)
admin.site.register(Tool, detTool)
admin.site.register(Comment, detComment)