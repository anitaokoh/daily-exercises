def calculate_earnings(hourly_wage,hours_worked):
    pre_tax = hourly_wage * hours_worked
    if pre_tax >= 2000:
        post_tax = pre_tax * 0.7
    else:
        post_tax = pre_tax * 0.85
    return f'pre-tax: {pre_tax} and post-tax: {post_tax}'