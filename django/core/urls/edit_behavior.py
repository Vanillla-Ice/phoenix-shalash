# core/urls/edit_behavior.py
from django.urls import path
from core.views import edit_behavior_views

urlpatterns = [
    path(
        "<int:year>/<int:month>/<int:day>/<int:hour>/<int:minute>/<int:second>/<int:classId>/",
        edit_behavior_views.edit_behavior_view,
        name="edit_behavior",
    ),
    path(
        "get_lessons_for_group/<int:selectedGroupID>/",
        edit_behavior_views.get_lessons_for_group,
        name="get_lessons_for_group",
    ),
    path(
        "",
    ),
]
