# Generated by Django 4.0.4 on 2022-05-13 11:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tool',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(default='', max_length=50)),
                ('description', models.CharField(default='', max_length=200)),
                ('image', models.FileField(default='', upload_to='tools/<function device_upload_image at 0x0000017B94EE9D80>')),
                ('insertDate', models.DateField(auto_now_add=True, null=True)),
                ('status', models.BooleanField(blank=True, default=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='UserTech',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('password', models.IntegerField()),
            ],
        ),
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('commentDate', models.DateField(auto_now_add=True, null=True)),
                ('description', models.CharField(default='', max_length=200)),
                ('fk_tool', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apiv1.tool')),
                ('fk_user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='apiv1.usertech')),
            ],
        ),
    ]
