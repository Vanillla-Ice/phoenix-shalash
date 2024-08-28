from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.db.models import F
from app.models import GroupClass, Lesson, Visits, Course, MarkType, MarkCategory, Child
from django.contrib.auth.decorators import login_required
from django.views.decorators.http import require_POST
import json


def edit_behavior_view(request, year, month, day, hour, minute, second, classId):
    lesson_date = f"{year}-{month}-{day} {hour}:{minute}:{second}"

    group_class = get_object_or_404(
        GroupClass, class_id=classId, teacher_id=request.user.id
    )

    lesson = get_object_or_404(Lesson, class_id=group_class, lesson_date=lesson_date)

    course = get_object_or_404(Course, course_id=group_class.course_id.course_id)

    mark_types = MarkType.objects.filter(coursebymarktype__course_id=course.course_id)

    mark_types_json = [
        {
            "mark_type_id": mark_type.mark_type_id,
            "description": mark_type.description,
            "min_value": mark_type.min_value,
            "max_value": mark_type.max_value,
            "mark_category": mark_type.mark_category.mark_category,
        }
        for mark_type in mark_types
    ]

    mark_categories = MarkCategory.objects.filter(marktype__in=mark_types).distinct()

    mark_categories_json = [
        {
            "mark_category": mark_category.mark_category,
            "mark_category_description": mark_category.description,
        }
        for mark_category in mark_categories
    ]

    visits = Visits.objects.filter(class_id=group_class, lesson_date=lesson_date)

    visits_json = [
        {
            "visit_id": visit.visit_id,
            "child_id": visit.child_id.child_id,
            "child_name": get_object_or_404(
                Child, child_id=visit.child_id.child_id
            ).name,
            "child_surname": get_object_or_404(
                Child, child_id=visit.child_id.child_id
            ).surname,
            "child_patronymic": get_object_or_404(
                Child, child_id=visit.child_id.child_id
            ).patronymic,
            "description": visit.description,
        }
        for visit in visits
    ]

    response_data = {
        "course_id": course.course_id,
        "course_name": course.course_name,
        "mark_types": mark_types_json,
        "mark_categories": mark_categories_json,
        "visits": visits_json,
    }
    print(response_data)
    return JsonResponse(response_data, safe=False)


def get_lessons_for_group(request, selectedGroupID):
    group_classes = GroupClass.objects.filter(group_id=selectedGroupID)

    lessons = Lesson.objects.filter(class_id__in=group_classes)

    lessons_json = [
        {
            "lesson_date": lesson.lesson_date,
            "class_id": lesson.class_id.class_id,
        }
        for lesson in lessons
    ]

    return JsonResponse(lessons_json, safe=False)


@login_required
@require_POST
def save_assessment_data(request):
    try:
        content = json.loads(request.body)
    except json.JSONDecodeError:
        print("Невозможно декодировать данные.")
        return JsonResponse({"status": "error"})

    #
    # content - это хрень по типу такой:
    # [{'visit_id': 23, 'marks': {'1': '3', '2': '3', '3': '3', '4': '3', '5': '3', '6': '2', '7': '3', '8': '2', '9': '3', '10': '2', '11': '3', '12': '2', '13': '3'}},
    #  {'visit_id': 25, 'marks': {'1': '3', '2': '3', '3': '3', '4': '3', '5': '3', '6': '3', '7': '3', '8': '3', '9': '3', '10': '3', '11': '3', '12': '2', '13': '3'}}]
    #
    # visit_id - ну это айди визита, отношение visits
    # marks - проставленные оценки, вообще, на стороне клиента есть проверка, что всё проставлено, можно не заморпачиватьсяч
    #
    #
    #

    return JsonResponse({"status": "ok"})
