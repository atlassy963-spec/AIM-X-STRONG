@tool
extends EditorPlugin

# ضع رابط مستودعك هنا
const REPO_URL = "https://github.com/atlassy963-spec/AIM-X-STRONG"

func _enter_tree() -> void:
    # تسجيل الإضافة في أداة التحديث عند تفعيلها
    var updater = get_node_or_null("/root/PluginUpdater")
    if updater:
        # تمرير مسار الإضافة الحالي ورابط المستودع
        updater.add_plugin(get_script().resource_path.get_base_dir(), REPO_URL)

func _exit_tree() -> void:
    # إزالة الإضافة من أداة التحديث عند إيقافها
    var updater = get_node_or_null("/root/PluginUpdater")
    if updater:
        updater.remove_plugin(get_script().resource_path.get_base_dir())
