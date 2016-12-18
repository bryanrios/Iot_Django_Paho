from django.conf.urls import url
from . import views

app_name = 'IoT_SmartHome'

urlpatterns = [
    # /IoT_SmartHome/
    url(r'^$', views.index, name='index'),

]
