from django.contrib import admin

# Register your models here.
from .models import Room, Temp, Light

admin.site.register(Room)
admin.site.register(Temp)
admin.site.register(Light)
