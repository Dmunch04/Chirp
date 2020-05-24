egrep -nr '(TODO)' ../source/ | sed 's/: */: /g' > ../TODO.md
python3 prettifier.py
