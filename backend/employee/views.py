from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import DepartmentModel, SkillModel, EmployeeModel
from .serializer import DepartmentSerializer, SkillSerializer, EmployeeSerializer

# Get Departments, Create Deparment
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

# Get, Put, Delete Department
class DepartmentDetail(APIView):
    def delete(self, request, pk):
        department = get_object_or_404(DepartmentModel, pk=pk)
        
        department.delete()
        
        return Response({'Message': 'Department Deleted'}, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        department = get_object_or_404(DepartmentModel, pk=pk)
        
        serializer = DepartmentSerializer(department, data=request.data, partial=True)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def get(self, request, pk):
        deparment = get_object_or_404(DepartmentModel, pk=pk)
        
        serializer = DepartmentSerializer(deparment)
        
        return Response(serializer.data, status=status.HTTP_200_OK)

# Get Skills, Create Skill
class SkillListCreate(APIView):
    def get(self, request):
        skills = SkillModel.objects.all()
        
        serializer = SkillSerializer(skills, many=True)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    def post(self, request):
        serializer = SkillSerializer(data=request.data)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# Get, Put, Delete Skill  
class SkillDetail(APIView):
    def delete(self, request, pk):
        skill = get_object_or_404(SkillModel, pk=pk)
        
        skill.delete()
        
        return Response({'Message': 'Skill Deleted'}, status=status.HTTP_200_OK)
    
    def get(self, request, pk):
        skill = get_object_or_404(SkillModel, pk=pk)
        
        serializer = SkillSerializer(skill)
        
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk):
        skill = get_object_or_404(SkillModel, pk=pk)
        
        serializer = SkillSerializer(skill, data=request.data, partial=True)
        
        if serializer.is_valid():
            serializer.save()
            
            return Response(serializer.data, status=status.HTTP_200_OK)
        
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
# Get Employees, Create Employee
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
    
# Get, Put, Delete Employee
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
