
from django.views import generic
import website.settings


class MainPageView(generic.ListView):
    template_name = 'website/index.html'
    context_object_name = 'AppList'

    def get_queryset(self):
        return [app for app in website.settings.INSTALLED_APPS if not "django" in app]


