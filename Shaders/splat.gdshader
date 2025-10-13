shader_type canvas_item;

// Текстура родительского спрайта (передаем из кода)
uniform sampler2D parent_texture;
// UV преобразования для родительской текстуры
uniform vec2 parent_uv_offset = vec2(0.0);
uniform vec2 parent_uv_scale = vec2(1.0);

void fragment() {
    // Получаем цвет текущего спрайта (дочернего)
    vec4 child_color = texture(TEXTURE, UV);
    
    // Преобразуем UV координаты для родительской текстуры
    vec2 parent_uv = UV * parent_uv_scale + parent_uv_offset;
    
    // Получаем альфа-канал родителя
    float parent_alpha = texture(parent_texture, parent_uv).a;
    
    // Показываем текстуру дочернего спрайта только там, 
    // где родитель непрозрачен
    COLOR = child_color * parent_alpha;
}