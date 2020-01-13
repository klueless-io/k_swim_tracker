#include "k_swim_tracker.h"

VALUE rb_mKSwimTracker;

void
Init_k_swim_tracker(void)
{
  rb_mKSwimTracker = rb_define_module("KSwimTracker");
}
