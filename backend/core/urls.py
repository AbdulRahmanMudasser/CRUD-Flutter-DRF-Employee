from django.contrib import admin
from django.urls import path

from employee import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('departments/', views.DepartmentListCreate.as_view(), name='department-list-create'),
    path('skills/', views.SkillList.as_view(), name='skills-list'),
    path('employees/', views.EmployeeListCreate.as_view(), name='employee-list-create'),
    path('employees/<int:pk>', views.EmployeeDetail.as_view(), name='employee-detail'),
]
