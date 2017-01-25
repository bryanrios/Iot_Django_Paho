from django.db import models
# Create your models here.


class Room(models.Model):
    description = models.CharField(max_length=250)
    owner_name = models.CharField(max_length=250)
    owner_surname = models.CharField(max_length=250)
    avatar = models.FileField()

    def __str__(self):
        return 'The room belongs to ' + self.owner_name + ' ' + self.owner_surname


class Light(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    time = models.DateTimeField()
    value = models.CharField(max_length=5)

    def __str__(self):
        return 'Light state in room' + self.room.description + ' is: ' + str(self.value) + ' in time: ' + str(self.time)


class Temp(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    time = models.DateTimeField()
    value = models.FloatField()

    def __str__(self):
        return 'Temperature in room' + self.room.description + ' is: ' + str(self.value) + ' in time: ' + str(self.time)
