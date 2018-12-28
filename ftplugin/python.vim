"let g:ale_python_auto_pipenv = 1

"let b:ale_python_pylint_executable = 'python3'
"let b:ale_python_pylint_options = '-m pylint'

"let b:ale_python_mypy_executable = 'python3'
"let b:ale_python_mypy_options = '-m mypy'

"let b:ale_python_autopep8_executable = 'python'
"let b:ale_python_autopep8_options = '-m autopep8'

"let b:ale_python_black_executable = 'python'
"let b:ale_python_black_options = '-m black'

"let b:ale_python_yapf_executable = 'python'
"let b:ale_python_yapf_options = '-m yapf'

"let b:ale_python_isort_executable = 'python'
"let b:ale_python_isort_options = '-m isort'

let b:ale_linters = ['flake8']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'autopep8', 'black', 'isort', 'yapf']
