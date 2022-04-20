<?php

namespace App\DTO;

use App\Entity\Person;
use App\Entity\User;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PersonRepository")
 */
class PersonDTO
{
    private $id;
    private $email;
    private $firstname;
    private $lastname;
    private $_links;
    private $userClient;

    public function __construct(
        Person $person
    ) {
        $this->id = $person->getId();
        $this->email = $person->getEmail();
        $this->firstname = $person->getFirstname();
        $this->lastname = $person->getLastname();
        $this->_links = $person->get_links();

    }
/* created new objct of perosn as array  send person once is done */
    public function getPeopleDTO(array $people)
    {
        foreach ($people as $person) {
            $personDTO = new self($person);
            $peopleDTO[] = $personDTO;
        }

        return $peopleDTO;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    public function getUserClient(): ?User
    {
        return $this->userClient;
    }

    public function setUserClient(?User $userClient): self
    {
        $this->userClient = $userClient;

        return $this;
    }

    public function get_Links(): ?array
    {
        return $this->_links;
    }

    public function set_Links(array $links): self
    {
        $this->_links = $links;

        return $this;
    }
}
