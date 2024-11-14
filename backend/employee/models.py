from django.db import models

# Department Model
class DepartmentModel(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name

# Skill Model
class SkillModel(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name
    
# Employee Model
class EmployeeModel(models.Model):
    name = models.CharField(max_length=100)
    position = models.CharField(max_length=100)
    salary = models.DecimalField(decimal_places=2, max_digits=10)
    hire_date = models.DateField()
    email = models.EmailField(unique=True)
    department = models.ForeignKey(DepartmentModel, on_delete=models.CASCADE)
    skills = models.ManyToManyField(SkillModel)
    manager = models.ForeignKey('self', null=True, blank=True, on_delete=models.CASCADE, related_name='subordinates')
    
    def __str__(self):
        return self.name
