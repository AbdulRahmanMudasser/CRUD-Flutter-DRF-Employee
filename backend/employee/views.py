from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import DepartmentModel, SkillModel, EmployeeModel
from .serializer import DepartmentSerializer, SkillSerializer, EmployeeSerializer

class DepartmentListCreate(APIView):
    def get(self, request):
        departments = DepartmentModel.objects.all()
    
        serializer = DepartmentSerializer(departments, many=True)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializer = DepartmentSerializer(data=request.data)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
class SkillList(APIView):
    def get(self, request):
        skills = SkillModel.objects.all()
        
        serializer = SkillSerializer(skills, many=True)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
class EmployeeListCreate(APIView):
    def get(self, request):
        employees = EmployeeModel.objects.all()
        
        serializer = EmployeeSerializer(employees, many=True)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializer = EmployeeSerializer(data=request.data)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
class EmployeeDetail(APIView):
    def get(self, request, pk):
        employee = get_object_or_404(EmployeeModel, pk=pk)
        
        serializer = EmployeeSerializer(employee)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        employee = get_object_or_404(EmployeeModel, pk=pk)
        
        serializer = EmployeeSerializer(employee, data=request.data, partial=True)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_200_OK)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk):
        employee = get_object_or_404(EmployeeModel, pk=pk)
        
        employee.delete()
        
        return Response({'Message': 'Employee Deleted'}, status=status.HTTP_200_OK)
