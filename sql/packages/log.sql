
-- *** The Lost Letter ***
/* PROBLEM 1:
    Clerk, my name’s Anneke. I live over at 900 Somerville Avenue.
    Not long ago, I sent out a special letter. It’s meant for my
    friend Varsha. She’s starting a new chapter of her life at 2
    Finnegan Street, uptown. (That address, let me tell you: it
    was a bit tricky to get right the first time.) The letter is
    a congratulatory note—a cheery little paper hug from me to
    her, to celebrate this big move of hers. Can you check if
    it’s made its way to her yet?
*/

SELECT address, type        -- find package drop off address information
FROM addresses
WHERE id = (
    SELECT address_id       -- find the package drop off address id
    FROM scans 
    WHERE package_id = (
        SELECT id           -- find Anneke's package id
        FROM packages 
        WHERE from_address_id = (
            SELECT id       -- find Anneke's address id
            FROM addresses 
            WHERE address = '900 Somerville Avenue'
        )  AND contents LIKE '%congratulatory%'
    ) AND action = 'Drop'
);


-- *** The Devious Delivery ***
/* PROBLEM 2:
    Good day to you, deliverer of the mail. You might remember
    that not too long ago I made my way over from the town of
    Fiftyville. I gave a certain box into your reliable hands
    and asked you to keep things low. My associate has been
    expecting the package for a while now. And yet, it appears
    to have grown wings and flown away. Ha! Any chance you
    could help clarify this mystery? Afraid there’s no “From”
    address. It’s the kind of parcel that would add a bit more…
    quack to someone’s bath times, if you catch my drift.
*/

SELECT contents             -- find package without a from address with content... "duck"
FROM packages
WHERE (from_address_id IS NULL) AND (contents LIKE '%duck%');

SELECT type                 -- find package drop off address infomation
FROM addresses
WHERE id = (
    SELECT address_id       -- find address id where the package was dropped
    FROM scans 
    WHERE package_id = (
        SELECT id       
        FROM packages
        WHERE (from_address_id IS NULL) AND (contents LIKE '%duck%')
    ) AND action = 'Drop'
);


-- *** The Forgotten Gift ***
/* PROBLEM 3:
    Oh, excuse me, Clerk. I had sent a mystery gift, you see,
    to my wonderful granddaughter, off at 728 Maple Place.
    That was about two weeks ago. Now the delivery date has
    passed by seven whole days and I hear she still waits,
    her hands empty and heart filled with anticipation. I’m a
    bit worried wondering where my package has gone. I cannot
    for the life of me remember what’s inside, but I do know
    it’s filled to the brim with my love for her. Can we
    possibly track it down so it can fill her day with joy?
    I did send it from my home at 109 Tileston Street.
*/

SELECT contents             -- find the content of the package sent from 109 Tileston Street 
FROM packages
WHERE from_address_id = (
    SELECT id
    FROM addresses
    WHERE address = '109 Tileston Street'
);


SELECT name                 -- find the name of the driver who has the package
FROM drivers
WHERE id = (
    SELECT driver_id        -- find the current status of the forgotten gift... picked up by driver_id = 17
    FROM scans
    WHERE package_id = (
        SELECT id           -- find the id of the forgotten gift
        FROM packages
        WHERE from_address_id = (
            SELECT id 
            FROM addresses 
            WHERE address = '109 Tileston Street'
        )
    ) AND (address_id IS NOT 9873) AND (action IS NOT 'Drop')
);