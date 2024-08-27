# core/views/statistics_views.py
from django.shortcuts import render
from django.contrib.auth.decorators import login_required

@login_required
def statistics(request):
    return render(request, 'statistics/statistics.html')
