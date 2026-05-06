# Smart Food Redistribution

Smart Food is a Laravel 12 food redistribution platform where donors can post surplus food and receiver organizations can claim and complete pickups.

## Features

- Donor and receiver registration
- MySQL-backed donation marketplace
- Donation claim and pickup completion flow
- Dashboard stats and recent notifications
- Impact page with seeded sample data
- PHPUnit feature tests for core flows

## Tech Stack

- PHP 8.2
- Laravel 12
- MySQL
- Blade
- Tailwind/Vite
- PHPUnit 11

## Requirements

- PHP 8.2 or higher
- Composer
- Node.js and npm
- MySQL

## Installation

1. Clone the project and move into the folder:

```bash
git clone <your-repository-url>
cd smart_food_redistribution
```

2. Install backend and frontend dependencies:

```bash
composer install
npm install
```

3. Create the environment file:

```bash
copy .env.example .env
```

4. Generate the application key:

```bash
php artisan key:generate
```

5. Update the database settings in `.env`:

```env
APP_NAME="Smart Food"
APP_ENV=local
APP_DEBUG=true
APP_URL=http://127.0.0.1:8000

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=smart_food_redistribution
DB_USERNAME=root
DB_PASSWORD=
```

6. Create a MySQL database named `smart_food_redistribution`.

7. Run migrations and seed demo data:

```bash
php artisan migrate:fresh --seed
php artisan optimize:clear
```

## Run The Application

Start the Laravel server:

```bash
php artisan serve
```

Start Vite in a separate terminal:

```bash
npm run dev
```

Open the app in your browser:

```text
http://127.0.0.1:8000
```

## Demo Credentials

These accounts are created by `database/seeders/ImpactSeeder.php`.

### Main Accounts

| Role | Name | Email | Password | Notes |
| --- | --- | --- | --- | --- |
| Admin | System Admin | `admin@example.com` | `password` | Use this to access the admin dashboard and moderation tools |
| Donor | Green Valley Hotel | `donor@example.com` | `password` | Default donor account |
| Receiver | City Charity | `receiver@example.com` | `password` | Default receiver account |

### Extra Demo Accounts

| Role | Name | Email | Password | Notes |
| --- | --- | --- | --- | --- |
| Donor | Fresh Bites Cafe | `freshbites@example.com` | `password` | Has recent donation activity |
| Receiver | Hope Kitchen | `hopekitchen@example.com` | `password` | Used in recent claims and reports |
| Donor | Late Night Buffet | `latenight@example.com` | `password` | Suspended account for admin testing |

## Seeded Demo Data You Can Explore

After running `php artisan migrate:fresh --seed`, the database includes:

- 6 demo user accounts
- 5 older monthly impact donations
- 5 recent donations with mixed states: `available`, `claimed`, `completed`, `hidden`, and `expired`
- 3 reports with both `open` and `resolved` statuses
- 1 suspended donor with a suspension reason
- 1 hidden donation with moderation details
- Resolved reports with `admin_notes`, `resolved_by`, and `resolved_at`

## Quick Explore Guide

If you want to test the main flows quickly:

1. Log in as `admin@example.com` / `password` and open `/admin`
2. Log in as `donor@example.com` / `password` to view donor dashboard and donation flow
3. Log in as `receiver@example.com` / `password` to claim available donations
4. Log in as `freshbites@example.com` / `password` to inspect recent donor activity
5. Log in as `latenight@example.com` / `password` to verify suspended-account behavior

The default Breeze registration flow can also be used to create fresh accounts.

## Testing

Run the full suite:

```bash
php artisan test
```

Run only the main flow tests:

```bash
php artisan test tests/Feature/Auth/RegistrationTest.php tests/Feature/ProfileTest.php tests/Feature/DonationFlowTest.php
```

## Notes

- The project is configured to run on MySQL, not SQLite.
- A Windows-safe filesystem fallback is registered during testing to avoid Blade compiled-view rename lock issues.
- Session, queue, and cache are currently database-backed in the main app environment.

## Important Paths

- Home page: `resources/views/home.blade.php`
- Marketplace controller: `app/Http/Controllers/DonationController.php`
- Dashboard controller: `app/Http/Controllers/DashboardController.php`
- Seeders: `database/seeders`
- Tests: `tests/Feature`
