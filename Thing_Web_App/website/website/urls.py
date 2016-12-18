
from django.conf.urls import include, url
from django.contrib import admin
from . import views

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^hwdata/', include('hwdata.urls')),
    url(r'^IoT_SmartHome/', include('IoT_SmartHome.urls')),
    url(r'^$', views.MainPageView.as_view()),
]
