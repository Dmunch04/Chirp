import datetime

with open('../TODO.md', 'r+') as todo:
	lines = todo.readlines()
	todo.seek(0)
	todo.truncate()
	elements = []
	for line in lines:
		path, number, _, message = line.split(':')
		path = path.replace('../source/', '')
		number = number.strip()
		file_path = f'{Path}:{Number}'
		status = 'N/A'
		
		if '->' in message:
			message, status = message.split('->')
			message = message.strip()
			status = status.strip()

		else:
			message = message.strip()

		elements.append(f'| {message} | `{status}` | `{filePath}` |')

	todo.write('# TODO\n\n')
	todo.write('| Message | Status | File |\n')
	todo.write('| --- | --- | --- |\n')
	todo.write('\n'.join(elements))
	todo.write(f'\n\n> Total items: `{str(len(elements))}`')
	todo.write(f'\n\n> Last generated at: `{datetime.datetime.now().strftime("%d/%m/%y - %H:%M:%S")}`')
