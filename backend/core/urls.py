from django.contrib import admin
from django.urls import path

from employee import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('departments/', views.DepartmentListCreate.as_view(), name='department-list-create'),
    path('department/<int:pk>', views.DepartmentDetail.as_view(), name='department-detail'),
    path('skills/', views.SkillListCreate.as_view(), name='skills-list-create'),
    path('skill/<int:pk>', views.SkillDetail.as_view(), name='skills-detail'),
    path('employees/', views.EmployeeListCreate.as_view(), name='employee-list-create'),
    path('employee/<int:pk>', views.EmployeeDetail.as_view(), name='employee-detail'),
]
