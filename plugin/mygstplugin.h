#include <gst/gst.h>

typedef struct _MyGstPlugin{
  GstElement element;
  GstPad *sinkpad, *srcpad;
  gboolean silent;
} MyGstPlugin;

typedef struct _MyGstPluginClass{
  GstElementClass parent_class;
} MyGstPluginClass;

#define GST_TYPE_MY_GST_PLUGIN    (gst_my_gst_plugin_get_type())
#define GST_MY_GST_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), GST_TYPE_MY_GST_PLUGIN, MyGstPlugin))
#define GST_MY_GST_PLUGIN_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_CAST((klass), GST_TYPE_MY_GST_PLUGIN, MyGstPluginClass))
#define GST_IS_MY_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_TYPE((obj), GST_TYPE_MY_GST_PLUGIN))
#define GST_IS_MY_PLUGIN_CLASS(klass) \
  (G_TYPE_CHECK_CLASS_TYPE((klass), GST_TYPE_MY_GST_PLUGIN))

GType gst_my_gst_plugin_get_type(void);
