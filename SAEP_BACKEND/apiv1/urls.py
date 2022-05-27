from django.urls import path
from .views import *

urlpatterns = [
    path('users/',UserTechAPIView.as_view()),
    path('tool/', ToolsAPIView.as_view()),
    path('comment/', CommentsAPIView.as_view()),
    

    path('users/<int:pk>',UserTechAPIView.as_view()),
    path('tool/<int:pk>', ToolsAPIView.as_view()),
    path('comment/<int:pk>', CommentsAPIView.as_view()),
]