import datetime
from .models import *
from .serializers import *
from rest_framework.views import APIView
from rest_framework.response import Response


class UserTechAPIView(APIView):

    def get(self, request, pk=''):
        if pk == '':
            user = UserTech.objects.all()
            serializer = UserTechSerializer(user, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
        else:
            user = UserTech.objects.get(id=pk)
            serializer = UserTechSerializer(user, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
    
    def post(self, request):
        if 'auth' in request.GET:
            password = request.data['password']
            user = UserTech.objects.filter(password=password)
            if user:
                serializer = UserTechSerializer(user, many=True)
                return Response(
                    {
                        'msg': serializer.data
                    }
                )
            else:
                return Response(
                    {
                        'msg': "Usuário Não encontrado"
                    }
                )
        else:
            serializer = UserTechSerializer(data=request.data, many=True)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {
                    'msg':'Inserido com sucesso'
                }
            )
    
    def put(self, request, pk=''):
        if pk != '':
            user = UserTech.objects.get(id=pk)
            serializer = UserTechSerializer(user, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {
                    'data': serializer.data
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )
    
    def delete(self, request, pk=''):
        if pk != '':
            user = UserTech.objects.get(id=pk)
            user.delete()
            return Response(
                {
                    'data': "Usuário deletado com Sucesso"
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )


class ToolsAPIView(APIView):

    def get(self, request, pk=''):
        if 'ano' in request.GET:
            ano = request.GET['ano']
            tool = Tool.objects.filter(date__gte=datetime.date(int(ano), 1, 1))
            serializer = ToolSerializer(tool, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
        elif pk == '':
            tool = Tool.objects.all()
            serializer = ToolSerializer(tool, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
        else:
            tool = Tool.objects.get(id=pk)
            serializer = ToolSerializer(tool, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
    
    def post(self, request):
        serializer = ToolSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(
            {
                'msg':'Inserido com sucesso'
            }
        )
    
    def put(self, request, pk):
        if pk != '':
            tool = Tool.objects.get(id=pk)
            serializer = ToolSerializer(tool, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {
                    'data': serializer.data
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )
    
    def delete(self, request, pk):
        if pk != '':
            tool = Tool.objects.get(id=pk)
            tool.delete()
            return Response(
                {
                    'data': "Usuário deletado com Sucesso"
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )

class CommentsAPIView(APIView):

    def get(self, request, pk=''):
        if 'oderByUser' in request.GET:
            itemID = request.GET['itemid']
            print(itemID)
            itemComments = Comment.objects.filter(fk_tool=itemID)
            comments = itemComments.order_by("fk_user__name", 'fk_user')
            serializer = GetCommentsSerializer(comments, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
        elif pk == '':
            comments = Comment.objects.all()
            serializer = GetCommentsSerializer(comments, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
        else:
            comments = Comment.objects.get(id=pk)
            serializer = CommentsSerializer(comments, many=True)
            return Response(
                {
                    'data':serializer.data
                }
            )
    
    def post(self, request):
        serializer = CommentsSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(
            {
                'msg':'Inserido com sucesso'
            }
        )
    
    def put(self, request, pk):
        if pk != '':
            comments = Tool.objects.get(id=pk)
            serializer = CommentsSerializer(comments, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(
                {
                    'data': serializer.data
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )
    
    def delete(self, request, pk):
        if pk != '':
            comment = Comment.objects.get(id=pk)
            comment.delete()
            return Response(
                {
                    'data': "Usuário deletado com Sucesso"
                }
            )
        else:
            return Response(
                {
                    'msg': 'Insirir ID de Usuario'
                }
            )