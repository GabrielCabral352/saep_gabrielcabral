# Generated by Django 4.0.4 on 2022-05-27 10:58

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('apiv1', '0004_alter_tool_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='tool',
            name='cDate',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]