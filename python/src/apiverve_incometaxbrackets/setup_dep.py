from setuptools import setup, find_packages

setup(
    name='apiverve_incometaxbrackets',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Income Tax Brackets retrieves federal income tax brackets, marginal rates, and standard deductions across all US filing statuses. Paid plans can query specific historical tax years back to 2000.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/incometax?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
