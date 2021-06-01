from setuptools import (
    setup,
    find_packages,
)

setup(
    name='package',
    version='0.1dev',
    description='',
    long_description='',
    keywords='',
    url='',
    download_url='',
    author='',
    author_email='',
    licence='',
    zip_safe=False,
    
    packages=find_packages(where='src'),
    package_data={
        'package': [
            'file_relative_to_package_dir_in_src',
        ],
    },
    include_package_data=True,

    install_requires=[
        'tool1',
        'package5',
    ],

    setup_requires=['pytest-runner']
    tests_require=[
        'pytest',
        'pytest-cov',
        'wily',
    ],

    entry_points={
        'console_scripts: [
            'master = package.module:callable',
        ],
    },
)
