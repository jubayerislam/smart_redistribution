<?php

namespace Database\Seeders;

use App\Models\Donation;
use App\Models\Report;
use App\Models\User;
use Illuminate\Database\Seeder;

class ImpactSeeder extends Seeder
{
    public function run(): void
    {
        $now = now();

        // Core demo accounts
        $donor = User::create([
            'name' => 'Green Valley Hotel',
            'email' => 'donor@example.com',
            'password' => 'password',
            'role' => 'donor',
            'organization_name' => 'Green Valley Hotels Group',
        ]);

        $ngo = User::create([
            'name' => 'City Charity',
            'email' => 'receiver@example.com',
            'password' => 'password',
            'role' => 'receiver',
            'organization_name' => 'City Hope Foundation',
        ]);

        $admin = User::create([
            'name' => 'System Admin',
            'email' => 'admin@example.com',
            'password' => 'password',
            'role' => 'admin',
            'organization_name' => 'EcoFeed Operations',
        ]);

        // Extra recent users for dashboard activity
        $backupDonor = User::create([
            'name' => 'Fresh Bites Cafe',
            'email' => 'freshbites@example.com',
            'password' => 'password',
            'role' => 'donor',
            'organization_name' => 'Fresh Bites Cafe Ltd.',
            'created_at' => $now->copy()->subDays(4),
            'updated_at' => $now->copy()->subDays(4),
        ]);

        $recentReceiver = User::create([
            'name' => 'Hope Kitchen',
            'email' => 'hopekitchen@example.com',
            'password' => 'password',
            'role' => 'receiver',
            'organization_name' => 'Hope Kitchen Network',
            'created_at' => $now->copy()->subDays(2),
            'updated_at' => $now->copy()->subDays(2),
        ]);

        $suspendedDonor = User::create([
            'name' => 'Late Night Buffet',
            'email' => 'latenight@example.com',
            'password' => 'password',
            'role' => 'donor',
            'organization_name' => 'Late Night Buffet House',
            'suspended_at' => $now->copy()->subDay(),
            'suspension_reason' => 'Repeated no-show handovers reported by receivers.',
            'created_at' => $now->copy()->subWeeks(2),
            'updated_at' => $now->copy()->subDay(),
        ]);

        // Older impact data across months
        $months = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
        $weights = [45.5, 62.0, 38.5, 82.0, 55.5];

        foreach ($months as $index => $month) {
            Donation::create([
                'donor_id' => $donor->id,
                'receiver_id' => ($index % 2 === 0) ? $ngo->id : null,
                'food_category' => 'Cooked Meals',
                'quantity' => '50 Servings',
                'quantity_kg' => $weights[$index],
                'expiry_time' => $now->copy()->subMonths(5 - $index)->addDays(2),
                'location' => 'Downtown Central',
                'status' => ($index % 2 === 0) ? 'completed' : 'available',
                'special_instructions' => 'Packed in insulated trays and ready for pickup.',
                'picked_up_at' => $index % 2 === 0 ? $now->copy()->subMonths(5 - $index)->addHours(6) : null,
                'created_at' => $now->copy()->subMonths(5 - $index),
                'updated_at' => $now->copy()->subMonths(5 - $index),
            ]);
        }

        // Recent live activity for marketplace and admin dashboard
        $availableDonation = Donation::create([
            'donor_id' => $backupDonor->id,
            'receiver_id' => null,
            'food_category' => 'Bakery Items',
            'quantity' => '32 Snack Boxes',
            'quantity_kg' => 18.5,
            'expiry_time' => $now->copy()->addHours(8),
            'location' => 'Banani, Dhaka',
            'special_instructions' => 'Collect before evening traffic. Includes sandwiches and muffins.',
            'status' => 'available',
            'created_at' => $now->copy()->subHours(3),
            'updated_at' => $now->copy()->subHours(3),
        ]);

        $claimedDonation = Donation::create([
            'donor_id' => $donor->id,
            'receiver_id' => $recentReceiver->id,
            'food_category' => 'Rice and Curry',
            'quantity' => '45 Meal Packs',
            'quantity_kg' => 27.0,
            'expiry_time' => $now->copy()->addHours(5),
            'location' => 'Dhanmondi, Dhaka',
            'special_instructions' => 'Receiver confirmed insulated transport.',
            'status' => 'claimed',
            'created_at' => $now->copy()->subHours(9),
            'updated_at' => $now->copy()->subHours(2),
        ]);

        $completedDonation = Donation::create([
            'donor_id' => $backupDonor->id,
            'receiver_id' => $ngo->id,
            'food_category' => 'Fresh Produce',
            'quantity' => '60 Vegetable Packs',
            'quantity_kg' => 41.25,
            'expiry_time' => $now->copy()->subHours(10),
            'location' => 'Uttara, Dhaka',
            'special_instructions' => 'Sorted into family-ready bundles.',
            'status' => 'completed',
            'picked_up_at' => $now->copy()->subHours(14),
            'created_at' => $now->copy()->subDay(),
            'updated_at' => $now->copy()->subHours(12),
        ]);

        $hiddenDonation = Donation::create([
            'donor_id' => $suspendedDonor->id,
            'receiver_id' => null,
            'food_category' => 'Buffet Leftovers',
            'quantity' => '80 Mixed Portions',
            'quantity_kg' => 36.0,
            'expiry_time' => $now->copy()->addHours(2),
            'location' => 'Mirpur, Dhaka',
            'special_instructions' => 'Quality check required before redistribution.',
            'status' => 'available',
            'is_hidden' => true,
            'moderated_by' => $admin->id,
            'moderated_at' => $now->copy()->subDay(),
            'moderation_reason' => 'Hidden automatically after donor suspension.',
            'created_at' => $now->copy()->subDays(2),
            'updated_at' => $now->copy()->subDay(),
        ]);

        $expiredDonation = Donation::create([
            'donor_id' => $donor->id,
            'receiver_id' => null,
            'food_category' => 'Dairy Products',
            'quantity' => '20 Yogurt Crates',
            'quantity_kg' => 14.0,
            'expiry_time' => $now->copy()->subHours(1),
            'location' => 'Mohakhali, Dhaka',
            'special_instructions' => 'Expired naturally for dashboard visibility.',
            'status' => 'available',
            'created_at' => $now->copy()->subHours(18),
            'updated_at' => $now->copy()->subHours(1),
        ]);

        // Reports with both open and resolved states
        Report::create([
            'type' => 'donation',
            'status' => 'open',
            'reporter_id' => $recentReceiver->id,
            'donation_id' => $availableDonation->id,
            'reason' => 'Pickup window was changed twice and the details need verification.',
            'created_at' => $now->copy()->subHours(2),
            'updated_at' => $now->copy()->subHours(2),
        ]);

        Report::create([
            'type' => 'user',
            'status' => 'resolved',
            'reporter_id' => $ngo->id,
            'reported_user_id' => $suspendedDonor->id,
            'reason' => 'Receiver reported repeated late confirmations from this donor.',
            'resolved_by' => $admin->id,
            'resolved_at' => $now->copy()->subDay(),
            'admin_notes' => 'Account suspended and active listing hidden after review.',
            'created_at' => $now->copy()->subDays(2),
            'updated_at' => $now->copy()->subDay(),
        ]);

        Report::create([
            'type' => 'donation',
            'status' => 'resolved',
            'reporter_id' => $recentReceiver->id,
            'donation_id' => $hiddenDonation->id,
            'reported_user_id' => $suspendedDonor->id,
            'reason' => 'Food safety concern raised after an incomplete item description.',
            'resolved_by' => $admin->id,
            'resolved_at' => $now->copy()->subHours(20),
            'admin_notes' => 'Listing reviewed and kept hidden pending donor re-verification.',
            'created_at' => $now->copy()->subDay(),
            'updated_at' => $now->copy()->subHours(20),
        ]);

        unset($month, $claimedDonation, $completedDonation, $expiredDonation);
    }
}
