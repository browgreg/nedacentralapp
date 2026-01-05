#!/bin/bash

if grep -R "withOpacity(" lib/; then
  echo "❌ ERROR: withOpacity() is forbidden. Use withAlpha()."
  exit 1
fi

exit 0
