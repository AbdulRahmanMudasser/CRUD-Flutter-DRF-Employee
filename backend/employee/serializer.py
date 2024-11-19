from rest_framework import serializers
from .models import DepartmentModel, SkillModel, EmployeeModel
from rest_framework.validators import UniqueValidator 

# Department Serializer
class DepartmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepartmentModel
        fields = ['id', 'name']
        
# Skill Serializer
class SkillSerializer(serializers.ModelSerializer):
    class Meta:
        model = SkillModel
        fields = ['id', 'name']
       
# Employee Serializer 
class EmployeeSerializer(serializers.Serializer):
    name = serializers.CharField(max_length=100)
    position = serializers.CharField(max_length=100)
    salary = serializers.DecimalField(decimal_places=2, max_digits=10)
    hire_date = serializers.DateField()
    email = serializers.EmailField(validators=[UniqueValidator(queryset=EmployeeModel.objects.all())])
    department = serializers.PrimaryKeyRelatedField(queryset=DepartmentModel.objects.all())
    skills = serializers.PrimaryKeyRelatedField(many=True, queryset=SkillModel.objects.all())
    manager = serializers.PrimaryKeyRelatedField(queryset=EmployeeModel.objects.all(), required=False, allow_null=True)
    
    def create(self, validated_data):
        skills = validated_data.pop('skills')
        employee = EmployeeModel.objects.create(**validated_data)
        employee.skills.set(skills)
        
        return employee
    
    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.position = validated_data.get('position', instance.position)
        instance.salary = validated_data.get('salary', instance.salary)
        instance.hire_date = validated_data.get('hire_date', instance.hire_date)
        instance.email = validated_data.get('email', instance.email)
        instance.department = validated_data.get('department', instance.department)
        instance.manager = validated_data.get('manager', instance.manager)
        
        if 'skills' in validated_data:
            skills = validated_data.pop('skills')
            instance.skills.set(skills)
            
        instance.save()
        
        return instance
