<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class Test extends TestCase
{
    public function testcoucou(): void
    {
        $this->assertEquals(
            3,
            1+2
        );
    }
}
