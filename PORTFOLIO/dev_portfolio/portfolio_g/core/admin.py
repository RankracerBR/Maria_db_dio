from django.contrib import admin
from .models import Usuarios
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from io import BytesIO
from django.http import HttpResponse

# Register your models here.
class UsuariosAdmin(admin.ModelAdmin):
    list_display = ('nome', 'comentario', 'data_postagem')
    list_filter = ('nome',)
    actions = ['gerar_grafico']
    
    def ver_grafico(self, obj):
        data = Usuarios.objects.all().values('data_postagem')
        comments_count = Usuarios.objects.all().count()
        dates = [item['data_postagem'] for item in data]
        date_counts = [i for i in range(1, comments_count + 1)]

        plt.plot(dates, date_counts)
        plt.xlabel('Data de Postagem')
        plt.ylabel('Contagem de Comentários')
        plt.title('Comentários ao longo do Tempo')
        plt.xticks(rotation=45)

        buffer = BytesIO()
        plt.savefig(buffer, format='png', bbox_inches='tight')
        buffer.seek(0)
        plt.close()

        return buffer

    ver_grafico.short_description = 'Gráfico de Comentários'
        
    def gerar_grafico(self, request, queryset):
        buffer = self.ver_grafico(None)

        response = HttpResponse(buffer.getvalue(), content_type='image/png')
        response['Content-Disposition'] = 'attachment; filename=grafico.png'
        buffer.close()

        return response

    gerar_grafico.short_description = 'Gerar Gráfico'

admin.site.register(Usuarios, UsuariosAdmin)