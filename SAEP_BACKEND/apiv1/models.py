
from statistics import mode
from tkinter.tix import Tree
from django.db import models


def device_upload_image(instance, filename):
    return f'{instance.id}-{filename}'

class UserTech(models.Model):
    name = models.CharField(max_length=50, null=False, blank=False)
    password = models.IntegerField(null=False, blank=False)

    def __str__(self) -> str:
        return self.name

class Tool(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False, default='')
    description = models.CharField(max_length=500, blank=False, null=False, default='')
    image = models.FileField(upload_to=device_upload_image, null=False, blank=False, default='')
    insertDate = models.DateField(auto_now_add=True, blank=True, null=True)
    status = models.BooleanField(default=True, blank=True, null=True)
    cDate = models.DateTimeField(blank=False, null=False, auto_now_add=True)

    def __str__(self) -> str:
        return self.name

class Comment(models.Model):
    
    commentDate = models.DateField(auto_now_add=True, blank=True, null=True)
    description = models.CharField(max_length=200, blank=False, null=False, default='')
    fk_tool = models.ForeignKey(Tool, null=False, blank=False, on_delete=models.CASCADE)
    fk_user = models.ForeignKey(UserTech, null=False, blank=False, on_delete=models.CASCADE)

    def __str__(self) -> str:
        return self.description